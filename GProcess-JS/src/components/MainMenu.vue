<template>
   <v-app id="inspire">
      <v-container fluid fill-height>
         <v-layout row wrap  >
            <v-flex xs3 class="text-xs-left"  >
               <v-btn color="red">
               </v-btn>
               <v-btn color="green"> </v-btn>
               <v-btn color="blue">
               </v-btn>
               <v-btn color="yellow">
               </v-btn>
            </v-flex>
            <v-flex xs6  class="text-xs-center "   >
            </v-flex>
            <v-flex xs3 class="text-xs-right ">
               <v-btn fab dark large color="purple">
                  <v-icon dark>home</v-icon>
               </v-btn>
            </v-flex>
         </v-layout >
      </v-container>
   </v-app>
</template>
<style scoped>
   .v-btn
   {
   width:5vw;
   height: 5vw;
   }
</style>