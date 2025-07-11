use core::poseidon::poseidon_hash_span;

fn commitmentCheck(age: u32, nonce: u32) -> felt252 {
    let append = age.into() + nonce.into(); // age || nonce
    let mut inputArray: Array<felt252> = array![append];
    let mut inputSpan = inputArray.span();
    let poseidonResult = poseidon_hash_span(inputSpan);
    return poseidonResult;
}



#[executable]
fn main(age: u32, nonce: u32) -> felt252 {
    return commitmentCheck(:age, :nonce);
}
