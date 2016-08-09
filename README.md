# content-indexer
Indexes tags and links of a given webpage

## API endpoints

### POST pages
This endpoint accepts a url parameter, which is the page were the content will be indexed.

Curl Example:
```bash
curl "http://localhost:3000/pages" -d "page[url]=https://tegon.github.io"
```

The page will be stored in the database, and his id will be returned
```json
{"id":1,"url":"https://tegon.github.io"}
```

### GET pages/:id
This endpoint will return the details of the page, incluid its links and tags

Curl Example:
```bash
curl "http://localhost:3000/pages/1"
```

Response
```json
{
   "id":1,
   "url":"https://tegon.github.io",
   "links":[
      {
         "href":"https://github.com/little-dice-games/velha-mania"
      },
      {
         "href":"https://github.com/tegon/TrucoMarreco"
      },
      {
         "href":"https://github.com/tegon/cineminha-bot"
      },
      {
         "href":"https://github.com/tegon/clone-org-repos"
      },
      {
         "href":"https://github.com/tegon/traktflix"
      },
      {
         "href":"https://play.google.com/store/apps/details?id=br.com.clickjogos"
      },
      {
         "href":"https://www.carrinhoemcasa.com.br/"
      },
      {
         "href":"http://www.minhaserie.com.br/"
      },
      {
         "href":"http://www.joguinhos.com.br"
      },
      {
         "href":"http://www.jogosdemeninas.com.br"
      },
      {
         "href":"http://www.clickjogos.com.br"
      },
      {
         "href":"https://play.google.com/store/apps/dev?id=7812285483653318759"
      },
      {
         "href":"https://twitter.com/tegonl"
      },
      {
         "href":"https://br.linkedin.com/in/tegon"
      },
      {
         "href":"https://github.com/tegon"
      }
   ],
   "tags":[
      {
         "type":"h1",
         "content":"Leonardo Tegon"
      },
      {
         "type":"h2",
         "content":"Work"
      },
      {
         "type":"h2",
         "content":"Open Source"
      },
      {
         "type":"h3",
         "content":"Click Jogos"
      },
      {
         "type":"h3",
         "content":"Jogos de Meninas"
      },
      {
         "type":"h3",
         "content":"Joguinhos"
      },
      {
         "type":"h3",
         "content":"Minha Série"
      },
      {
         "type":"h3",
         "content":"Carrinho em Casa"
      },
      {
         "type":"h3",
         "content":"Click Jogos Android"
      },
      {
         "type":"h3",
         "content":"traktflix"
      },
      {
         "type":"h3",
         "content":"clone-org-repos"
      },
      {
         "type":"h3",
         "content":"cineminha-bot"
      },
      {
         "type":"h3",
         "content":"TrucoMarreco"
      },
      {
         "type":"h3",
         "content":"velha-mania"
      }
   ]
}
```

### GET pages
This endpoint will returned all pages previous indexed

Curl Example:
```bash
curl "http://localhost:3000/pages"
```

The response is an array of pages
```json
[{"id":1,"url":"https://tegon.github.io"}]
```

## Development
First of all, clone this project in your local machine, then install the dependecies

```bash
cd content-indexer/
bundle install
```

Start the development server with

```bash
rails server
```
