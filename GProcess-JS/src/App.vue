<template>

  <div id="app">
    <div id="left-pane">
      <img src="./assets/logo.png" width="50%"> 
      <h2>GProcess - Connexion</h2>
     
    </div>
    <div id="right-pane">
         <v-carousel height=100%>
    <v-carousel-item 
      v-for="(item,i) in items"
      :key="i"
      style="height: 100%"
      :src="item.src"
    ></v-carousel-item>
  </v-carousel>
    </div>

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
        ]
    }
  },
  
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

}



#left-pane
{
  width: 25%;
  height: 100%;
  position: fixed;
  
  top: 0;
  padding-top:20px;
  padding-left:10;
  padding-right: 10;
  overflow: hidden;
  text-align: center;
 
  
}

#right-pane
{
  width: 75%;
  height: 100%;
  position: fixed;
  top: 0;
  right:0;
  overflow: hidden;
}
h1, h2, p {
  font-weight: normal;
}

</style>
