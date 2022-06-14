## Installation

### Required
- Ruby version 3 (maybe from 2.7 works but not less)
- PostgreSQL with no password required in localhost ( I had version 13) but with user pokemonapi created.
- `sudo -u postgres createuser --interactive` can help
- a working pg gem (might need to `gem install pg -- --with-pg-config='your specific path'`)

### Make it work
After cloning
- `bundle install`
- `rails db:setup`
- `rails db:migrate`
- `rails db:test:prepare`
- `rails db:seed`

then
- `rspec` for launching the test
- `rails s` for the server

## Usage

| verb   | Uri           | actions |
|--------|---------------|---------|
| GET    | /pokemons     | index   |
| POST   | /pokemons     | create  |
| GET    | /pokemons/:id | show    |
| PATCH  | /pokemons/:id | update  |
| PUT    | /pokemons/:id | update  |
| DELETE | /pokemons/:id | destroy |

### Index

Index is paginated. 25 elements per page by default.

You can change page or per page count by adding arguments to the GET request.

- `?page=2&per_page=5`  

Response headers also contained link to previous, next and last page.


### Create/update

Pokemon attributes have been normalized and must follow certain rules. A Payload for creation is as such :
```json
{
    "number": (strictly positive integer),
    "name": (string),
    "type1": (allowed type string),
    "type2": (allowed type string or nil),
    "total": (strictly positive integer),
    "hp": (strictly positive integer),
    "attack": (strictly positive integer),
    "defense": (strictly positive integer),
    "sp_attack": (strictly positive integer),
    "sp_defence": (strictly positive integer),
    "speed": (strictly positive integer),
    "generation": (strictly positive integer),
    "legendary": (Boolean),
}
```

Allowed pokemon types are:
- Normal 
- Fire 
- Water 
- Grass 
- Flying 
- Fighting 
- Poison 
- Electric 
- Ground 
- Rock 
- Psychic 
- Ice 
- Bug 
- Ghost 
- Steel 
- Dragon 
- Dark 
- Fairy
