<template>

  <div id="app">
    <v-app id="inspire">
    <v-container fluid fill-height>
    <v-layout row wrap  >
    <v-flex xs3 class="text-xs-center"  >
      <img src="./assets/logo.png" width="50%"> 
      <h2 class="display-1 font-weight-regular">GProcess - Connexion</h2>
 
     <v-form max-width="75%">
            <v-text-field  prepend-icon="person" name="Username" label="Nom de compte"></v-text-field>
            <v-text-field prepend-icon="lock" name="Password" label="Mot de passe" type="password"></v-text-field>
            <v-btn primary large block>Me connecter</v-btn>
               
            </v-form>

    </v-flex>
    <v-flex xs9 >
         <v-carousel height=100%>
    <v-carousel-item 
      v-for="(item,i) in items"
      :key="i"
      style="height: 100%"
      :src="item.src"
    ></v-carousel-item>
  </v-carousel>
    </v-flex>
</v-layout >
    </v-container>
    </v-app>
    </div>

</template>

<script>

export default {
  name: 'app',

  data () {
    return {
       items: [
          {
            src: require('./assets/splash_screen.jpg')
          },
          {
            src: require('./assets/splash_screen.jpg')
          },
          {
            src: require('./assets/splash_screen.jpg')
          },
          {
            src: require('./assets/splash_screen.jpg')
          }
        ],
      
    }
  },
  
}
</script>

<style>
#app {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  background-color: white;
  height: 100%;

}

#inspire
{
  background-color: white;
}



html, body {
    font-family: Roboto, sans-serif;
    height:100%;
    width: 100%;
}

.container
{
  height: 100%;
  padding: 0;
}

.v-form
{
  width: 75% !important; 
  display: inline-block !important;
}

</style>
