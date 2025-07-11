fn add(input1: u64, input2: u64, input3: u64) -> bool {
    let result = input1 + input2;
    let mut i = 0;
    loop {
        if i < input2 {
            i = i + 1;
        }
        if i == input2 {
            break;
        }
    }

    if result == input3 {
        return true;
    }
    return false;
}

#[executable]
fn main(input1: u64, input2: u64, input3: u64) -> bool {
    return add(:input1, :input2, :input3);
}