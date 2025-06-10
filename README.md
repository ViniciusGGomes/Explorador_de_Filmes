# Explorador de Filmes Flutter

Este aplicativo Flutter é um **explorador de filmes** que consome dados da API do [The Movie Database (TMDb)](https://www.themoviedb.org/) para mostrar filmes em cartaz.

## Funcionalidades

- Tela de filmes em cartaz
- Tela de favoritos
- Tela de watchlist (lista de filmes para assistir)
- Tela de detalhes de um filme
- Tela de configurações
- Drawer para navegar entre as telas
- Serviço `api_service.dart` responsável pelas requisições para a API TMDb

## Tela Principal

![Tela Principal](./img/flutter-projeto-movie.png)

## Como rodar o projeto

1. Clone este repositório
2. Configure sua chave de API TMDb no arquivo `api_service.dart`
3. Execute o comando:
   ```bash
   flutter pub get
   flutter run
   ```
