#language: pt

Funcionalidade: Minha foto
   Para que meu perfil fique bonito
   Sendo um usuário cadastrado
   Posso fazer upload da minha foto

   @foto @auth @perfil_logout
   Cenario: Carregar minha foto
       Dado que eu tenho uma foto muito bonita
       Quando faço o upload da minha foto
       Então devo ver a mensagem de upload com o texto "Agora seu perfil está bem legal."