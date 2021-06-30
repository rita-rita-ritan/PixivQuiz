<template>
  <v-card
    :loading="loading"
    class="mx-auto my-12"
    max-width="80%"
    :href=imageResponse.work_url
    target="_blank"
  >
    <template slot="progress">
      <v-progress-linear
        color="light-blue lighten-2"
        height="10"
        indeterminate
      ></v-progress-linear>
    </template>
    <v-img
      :src=imageResponse.opengraph_work_image_url
    ></v-img>

    <v-card-title>{{imageResponse.work_title}}</v-card-title>

    <v-card-text>

      <div class="text-subtitle-1">
        イラストデイリーランキング{{imageResponse.rank}}位
      </div>

      <div class="ms-n2">（{{imageResponse.timestamp}}時点）</div>
    </v-card-text>
  </v-card>
</template>

<script>
  export default {
    data: () => ({
      loading: false,
      selection: 1,
    }),

    props: {
      imageResponse: Object
    },

    methods: {
      reserve () {
        this.loading = true

        setTimeout(() => (this.loading = false), 2000)
      },
    },
  }
</script>