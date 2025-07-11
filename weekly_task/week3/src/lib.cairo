use core::poseidon::poseidon_hash_span;

fn commitmentCheck(age: u32, nonce: u32) -> felt252 {
    let append = age.into() + nonce.into(); // age || nonce
    let mut inputArray: Array<felt252> = array![append];
    let mut inputSpan = inputArray.span();
    let poseidonResult = poseidon_hash_span(inputSpan);
    return poseidonResult;
}

fn ageCheck(age: u32, min_age: u32) -> bool{
    if age >= min_age {
        return true;
    }
    return false;
}

#[executable]
fn main(age: u32, nonce: u32, commitment: felt252, min_age: u32) -> bool {
    assert!(commitment == commitmentCheck(:age, :nonce));
    if ageCheck(:age, :min_age) {
        println!("Pass");
        return true;
    }
    println!("Non-Pass");
    return false;
}