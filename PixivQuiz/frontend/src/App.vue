<template>
  <v-app>
    <v-app-bar
      app
      color="blue"
      dark
    >
      <div class="d-flex align-center">
        <!-- <v-img
          alt="Vuetify Logo"
          class="shrink mr-2"
          contain
          src="https://cdn.vuetifyjs.com/images/logos/vuetify-logo-dark.png"
          transition="scale-transition"
          width="40"
        /> -->
        <h1>Pixiv Quiz</h1>

        <!-- <v-img
          alt="Vuetify Name"
          class="shrink mt-1 hidden-sm-and-down"
          contain
          min-width="100"
          src="https://cdn.vuetifyjs.com/images/logos/vuetify-name-dark.png"
          width="100"
        /> -->
      </div>

      <v-spacer></v-spacer>

      <!-- <v-btn
        href="https://github.com/vuetifyjs/vuetify/releases/latest"
        target="_blank"
        text
      >
        <span class="mr-2">Latest Release</span>
        <v-icon>mdi-open-in-new</v-icon>
      </v-btn> -->
    </v-app-bar>

    <v-main>
      <v-container>
          PixivQuiz is a game where you look at the works in the Pixiv ranking
          and guess the painter.
      </v-container>
      <v-container>
        <v-row justify="center">
          <h2>API Result</h2>
        </v-row>
        <v-row justify="center">
          {{ info }}
        </v-row> 
      </v-container>
      <br>
      <v-container>
        <v-row
          justify="center"
        >
          <v-btn
            depressed
            color="light-blue lighten-2"
            dark
            v-on:click="getNextImage"
          >
            NEXT
          </v-btn>
        </v-row>
      </v-container>

    </v-main>
  </v-app>
</template>

<script>
// import HelloWorld from './components/HelloWorld';
import axios from 'axios'

export default {
  name: 'App',

  // components: {
  //   HelloWorld,
  // },

  data () {
    return {
      info: null
    }
  },
  mounted () {
    axios
      .get('/images')
      .then(response => (this.info = response.data))
  },
  methods: {
    getNextImage: function (event) {
      if (event) {
        axios
          .get('/images')
          .then(response => (this.info = response.data))
      }
    }
  }
};
</script>
