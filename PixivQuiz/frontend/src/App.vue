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
      <v-container class="mt-14 grey--text text--darken-1">
        <v-row
        justify="center"
        >
          <h1>絵師当てクイズ !</h1>
        </v-row>
      </v-container>

      <ImageCard :imageResponse='imageResponse'></ImageCard>
      <AnswerPanel
        :imageResponse='imageResponse'
        ref="answerPanel"
      ></AnswerPanel>

      <v-row
        justify="center"
      >
        <v-btn
          depressed
          color="light-blue lighten-2"
          dark
          v-on:click="onclickNext"
          class="ma-10"
          v-bind:disabled="isDisabledNextButton"
        >
          NEXT
        </v-btn>
      </v-row>

      <v-container class="mb-10 grey--text text--darken-1">
        <v-row
        justify="center"
        >
          <a 
            href="https://www.pixiv.net/ranking.php?mode=daily&content=illust"
            target="_blank"
          >
            現在のイラストデイリーランキング
          </a>
        </v-row>
      </v-container>

    </v-main>
  </v-app>
</template>

<script>
import axios from 'axios'
import ImageCard from './components/ImageCard.vue'
import AnswerPanel from './components/AnswerPanel.vue'

export default {
  name: 'App',

  components: {
    ImageCard,
    AnswerPanel,
  },

  data () {
    return {
      imageResponse: null,
      isDisabledNextButton: false
    }
  },
  mounted () {
    axios
      .get('/image')
      .then(response => (this.imageResponse = response.data))
  },
  methods: {
    onclickNext: function (event) {
      if (event) {
        this.scrollTop()
        this.disableNextButton()
        this.$refs.answerPanel.onNextButtonClicked()
        this.getNextImage()
      }
    },
    getNextImage: function () {
      axios
        .get('/image')
        .then(response => (this.imageResponse = response.data))
    },
    disableNextButton: function () {
      this.isDisabledNextButton = true
      setTimeout(this.enableNextButton,1000);
    },
    enableNextButton: function() {
      this.isDisabledNextButton = false
    },
    scrollTop: function() {
      window.scrollTo({
        top: 0,
        behavior: "smooth"
      });
    }
  }
};
</script>