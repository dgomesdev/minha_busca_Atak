# Minha busca Atak

### Descrição

Este aplicativo permite ao seu usuário fazer uma busca na internet e ter os resultados do Google de forma simplificada, com o título e link de cada resultado

### Stacks utilizadas

* [Flutter](https://docs.flutter.dev/)
* [Dart](https://dart.dev/tools/dart-doc)
* [Android Studio](https://developer.android.com/studio)

### Requisitos técnicos

* Celular com Android ou emulador do Android Studio junto ao Flutter SDK.

### Como executar o aplicativo

Baixar o APK diretamente [aqui](https://github.com/dgomesdev/) e instalar no celular, ou clonar o repositório/baixar e descompactar o zip com o códdigo fonte e executar usando uma IDE como o Android Studio ou VS Code ou executar o seguinte comando no terminal, estando na pasta raiz do projeto:
```
flutter run
```

## Observação

O aplicativo realiza a busca consultando uma API que está hospedada em uma instãncia EC2 da AWS

### Screenshots

#### Página principal

<img src="assets/pagina_principal_1.png" alt="Pagina principal com banco de busca vazio" width="250"/> <img src="assets/pagina_principal_2.png" alt="Pagina principal com campo de busca preenchido" width="250"/>

#### Página de resultados

<img src="assets/pagina_resultados_1.png" alt="Pagina com os resutlados da busca" width="250"/> <img src="assets/pagina_resultados_2.png" alt="Pagina com a mensagem sem resultados para sua busca" width="250"/>

#### Página de histórico de buscas

<img src="assets/pagina_historico_1.png" alt="Pagina com o histórico de buscas realizadas" width="250"/> <img src="assets/pagina_historico_2.png" alt="Pagina de histórico vazia com a mensagem seu histórico aparecerá aqui" width="250"/>