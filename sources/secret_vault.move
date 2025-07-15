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
    }

 public entry fun set_secret(caller:&signer,secret:vector<u8>){
    let secret_vault = Vault{secret: string::utf8(secret)};
     move_to(caller,secret_vault);
     event::emit(SetNewSecret {});
 }

    //// view functions

    #[view]
   public fun  get_secret (caller: address):String acquires Vault{
    assert! (caller == @owner,NOT_OWNER);
    let vault = borrow_global<Vault >(@owner);
    
        vault.secret
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
    
      // Verify the secret was added
    let valut = borrow_global<Vault>(owner_address);
    
    assert!(valut.secret == string::utf8(secret), 4);

    
    debug::print(&b"All tests passed!");
}
    
}