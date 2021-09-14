**Note: This project is now archived. The new URL of project is https://github.com/e-monkeys-tech/nushell-utils. This in order to allow the mutualization of the secrets used by the actions of the CI for all the repositories of the organization and no longer unitarily**

# Nushell useful snippets

## Build project with rust toolchain
```bash
git clone https://github.com/pbackz/nushell-utils
cargo build --release
```

## Use docker image 
```bash
docker run -it docker.io/pbackz/nushell-utils:latest

Welcome to Nushell 0.21.0 (type 'help' for more info)
/opt/nushell-utils(main)>
```

## CLI functions usage
```nu
❯ pattern_exists_in_array? [Column1, Value1, toto1] toto1
true
❯ pattern_exists_in_array? [Column1, Value1, toto1] titi
false


❯ pattern_exists_in_json? season-1819.json toto
false
❯ pattern_exists_in_json? season-1819.json 2019
true

❯ pattern_exists_in_csv? season-1819.csv toto
false
❯ pattern_exists_in_csv? season-1819.csv 2019
true

❯ if $"(pattern_exists_in_csv? season-1819.csv 2019)" != true { echo 'pattern not found' } { echo 'pattern found in file' }
pattern found in file

❯ find_files_acceeded_since! . .nu 1wk
───┬─────────────────────────────────────────────────────
 0 │ nushell-az-functions/az_functions.nu|28 mins ago    
 1 │ nushell-odds-api-client/odds-api-ctl.nu|14 mins ago 
 2 │ nushell-utils/utils_functions.nu|37 mins ago        
───┴─────────────────────────────────────────────────────

❯ find_files_modified_since! swift-client-rs/ .rs 1day
───┬──────────────────────────────────────────────────────────────────────────────────────────────────────────
 0 │ swift-client-rs/examples/list-containers.rs|9 hours ago                                                  
 1 │ swift-client-rs/src/main.rs|9 hours ago                                                                  
 2 │ swift-client-rs/target/release/build/mime_guess-b81b2db6ddcf2995/out/mime_types_generated.rs|9 hours ago 
 3 │ swift-client-rs/target/release/build/proc-macro-nested-c460b5ad1c5b68bc/out/count.rs|9 hours ago         
───┴──────────────────────────────────────────────────────────────────────────────────────────────────────────
```
