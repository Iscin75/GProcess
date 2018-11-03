<template>
   <v-app id="inspire">
      <v-container fluid fill-height>
         <v-layout row wrap  >
            <v-flex xs3 class="text-xs-center"  >
               <img src="../assets/logo.png" width="50%"> 
               <h2 class="display-1 font-weight-regular">GProcess - Connexion</h2>
               <v-form max-width="75%">
                  <v-text-field v-model="user" prepend-icon="person" name="Username" label="Nom de compte" required></v-text-field>
                  <v-text-field v-model="pass" prepend-icon="lock" name="Password" label="Mot de passe" type="password" required></v-text-field>
                     <v-btn primary large block @click="login" >Me connecter</v-btn>
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
</template>
<script>
   export default {
   
   data () {
   return {
   user:"",
   pass:"",
   isLogged: false,
   
   items: [
       {
         src: require('../assets/splash_screen.jpg')
       },
       {
         src: require('../assets/splash_screen.jpg')
       },
       {
         src: require('../assets/splash_screen.jpg')
       },
       {
         src: require('../assets/splash_screen.jpg')
       }
     ],
   }
   },
   
   
   methods:
   {
   login : function() {
       if(this.user != "" && this.pass != "") {
           if(this.user == "admin" && this.pass == "admin") {
        
               this.$router.isLogged = true;
               this.$router.push({ name: 'Home' })
           } else {
               console.log("The username and / or password is incorrect");
           }
       } else {
           console.log("A username and password must be present");
       }
   },
   }
   
   
   
   
   }
</script>
<style >
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
</style>
<style  scoped>
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