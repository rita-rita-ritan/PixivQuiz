<template>
  <v-row justify="center">
    <v-expansion-panels 
      accordion
      v-model="panel"
      multiple
    >
      <v-expansion-panel>
        <v-expansion-panel-header
        >答え</v-expansion-panel-header>
        <v-expansion-panel-content>
          <CreatorCard
            :imageResponse='imageResponse'
          ></CreatorCard>
        </v-expansion-panel-content>
      </v-expansion-panel>
    </v-expansion-panels>
  </v-row>
</template>

<script>
import CreatorCard from './CreatorCard.vue'

export default {
  props: {
    imageResponse: Object,
  },
  data(){
    return {
      panel: []
    }
  },
  components: {
    CreatorCard
  },
  methods: {
    openPanel(){
      this.panel = [0]
    },
    closePanel(){
      this.panel = []
    },
    onNextButtonClicked(){
      this.closePanel()
    }
  }
}
</script>

<style scoped>
.v-expansion-panels{
    max-width: 79%
}
</style>