<template>
  <div id="app">
    <div id="left-pane">
      <img src="./assets/logo.png" width="50%"> 
      <h2>GProcess - Connexion</h2>
      <p> Nom de compte : </p>
      <input type="text">
      <p> Mot de passe </p>
      <input type="password">
      <p><button > Me connecter </button> </p>
    </div>
    <div id="right-pane">
      <img src="./assets/splash_screen.jpg" width="100%" height="100%">
    </div>
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
   width:100%;
   height: 100%;
   margin: 0;
   overflow: hidden;
   padding: 0;
}

#left-pane
{
  width: 25%;
  height: 100%;
  position: fixed;
  z-index: 1;
  top: 0;
  padding-top:20px;
  overflow: hidden;
  text-align: center;
 
  
}

#right-pane
{
  width: 75%;
  height: 100%;
  position: fixed;
  z-index: 1;
  top: 0;
  right:0;
  overflow: hidden;
}
h1, h2, p {
  font-weight: normal;
}
</style>
