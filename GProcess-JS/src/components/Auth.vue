<template>
   <v-app id="inspire">
      <v-container fluid fill-height>
         <v-layout row wrap  >
            <v-flex xs3 class="text-xs-center"  >
               <img src="../assets/logo.png" width="50%"> 
               <h2 class="display-1 font-weight-regular">GProcess - Connexion</h2>
               <v-form max-width="75%" @submit.prevent="handleSubmit">
                  <v-text-field v-model="username" prepend-icon="person" name="Username" label="Nom de compte" required></v-text-field>
                  <v-text-field v-model="password" prepend-icon="lock" name="Password" label="Mot de passe" type="password" required></v-text-field>
                     <v-btn primary large block >Me connecter</v-btn>
                      <div v-if="error" class="alert alert-danger">{{error}}</div>
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

    import { router } from '../router';
    import { userService } from '../services';
   export default {
   
   data () {
   return {
    username: '',
    password: '',
    submitted: false,
    loading: false,
    returnUrl: '',
    error: '',

   
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
   
   
 created () {
        // reset login status
        userService.logout();

        // get return url from route parameters or default to '/'
        this.returnUrl = this.$route.query.returnUrl || '/login';
    },

methods: {
    handleSubmit (e) {

        this.submitted = true;
        const { username, password } = this;

        // stop here if form is invalid
        if (!(username && password)) {
            return;
        }

        this.loading = true;
        userService.login(username, password)
            .then(
                user => router.push(this.returnUrl),
                error => {
                    this.error = error;
                    this.loading = false;
                }
            );
    }
}
};
</script>
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