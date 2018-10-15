use std::io::prelude::*;
use std::fs::File;

let mut file = File::create("a.txt").expect("Cannot create file");
file.write_all(String::from("content").as_bytes()).expect("Cannot write file");
//file.write_all(b"content").expect("Cannot write file");
