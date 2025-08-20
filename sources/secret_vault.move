module secret_vault::vault{
    use std::signer;
    use std::string::{Self, String}; 
    use aptos_framework::event;
     #[test_only]
    use std::debug;

     /// Error codes
    const NOT_OWNER: u64 = 1;

    struct Vault has key {
        secret: String
    }
    // events
    #[event]
    struct SetNewSecret has drop, store {
        owner:address,
    }

 public entry fun set_secret(caller:&signer,secret:vector<u8>) acquires Vault{
    let addr = signer::address_of(caller);
    if(exists<Vault>(addr)) {
        let vault = borrow_global_mut<Vault>(addr);
        vault.secret = string::utf8(secret);
    }
    else{
    let secret_vault = Vault{secret: string::utf8(secret)};
     move_to(caller,secret_vault);
    };
     event::emit(SetNewSecret {owner: addr});
 }

    //// view functions

    #[view]
   public fun  get_secret (caller: &signer):String acquires Vault{
    let addr = signer::address_of(caller);
    let vault = borrow_global<Vault >(addr);
    // Return a fresh copy of the secret (cannot move out of a &borrow)
    string::utf8(string::bytes(&vault.secret))
    }

    #[test(owner = @0xcc, user = @0x123)]
fun test_secret_vault(owner: &signer,  user: &signer) acquires Vault{
    use aptos_framework::account;
    
    // Set up test environment
    account::create_account_for_test(signer::address_of(owner));
    account::create_account_for_test(signer::address_of(user));
    
    // Create a new todo list for the user
    let secret = b"i'm a secret";
    set_secret(owner,secret);
    
    // Get the owner address
    let owner_address = signer::address_of(owner);
    
    // Verify via direct global read
    let owner_address = signer::address_of(owner);
    let vault1 = borrow_global<Vault>(owner_address);
    assert!(vault1.secret == string::utf8(secret1), 4);

    // Owner updates secret
    let secret2 = b"updated secret";
    set_secret(owner, secret2);

    // Verify update
    let vault2 = borrow_global<Vault>(owner_address);
    assert!(vault2.secret == string::utf8(secret2), 5);

    // Owner can read via API
    let from_api = get_secret(owner);
    assert!(from_api == string::utf8(secret2), 6);
    debug::print(&b"All tests passed!");
}
    
}