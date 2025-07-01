fn is_prime(n: u128) -> bool {
    if n <= 1 { // 1
        return false;
    }
    if n == 2 { // 2 
        return true;
    }
    if n % 2 == 0 { // 2의 배수
        return false;
    }
    let mut i = 3;
    let mut is_prime = true;
    loop {
        if i * i > n { // 9보다 작은 수 중 2의 배수가 아닌 수는 전부 소수임
            break;
        }
        if n % i == 0 { // 3의 배수
            is_prime = false;
            break;
        }
        i += 2; // 5의 배수, 7의 배수, ... 임을 확인 
    }
    is_prime
}

#[executable]
fn main(input: u128) -> bool {
    if input > 1000000 {
        panic!("Input too large, must be <= 1,000,000");
    }
    is_prime(input)
}
