<template>
  <v-card
    :loading="loading"
    class="mx-auto my-auto"
    max-width="100%"
    :href=imageResponse.creator_url
    target="_blank"
  >

    <template slot="progress">
      <v-progress-linear
        color="light-blue lighten-2"
        height="10"
        indeterminate
      ></v-progress-linear>
    </template>

    <v-card-title>{{imageResponse.creator_name}}</v-card-title>

    <v-card-text>

      <div class="text-subtitle-1">
        {{imageResponse.opengraph_creator_description}}
      </div>
    </v-card-text>

    <v-img
      v-if="creatorImageExists"
      v-on:error="hideCreatorImage"
      :src=imageResponse.opengraph_creator_image_url
    ></v-img>
  </v-card>
</template>

<script>
  export default {
    data: () => ({
      loading: false,
      selection: 1,
      creatorImageExists: true
    }),

    props: {
      imageResponse: Object
    },

    methods: {
      reserve () {
        this.loading = true

        setTimeout(() => (this.loading = false), 2000)
      },
      revealCreatorImage: function () {
        this.creatorImageExists = true
      },
      hideCreatorImage: function () {
        this.creatorImageExists = false
      },
    },
  }
</script>