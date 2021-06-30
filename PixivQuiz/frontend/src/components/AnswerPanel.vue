<template>
  <v-row justify="center">
    <v-expansion-panels 
      accordion
    >
      <v-expansion-panel>
        <v-expansion-panel-header
          v-on:click="$emit('show-answer')"
        >答え</v-expansion-panel-header>
        <v-expansion-panel-content
          v-bind:class="{active: answerIsOpen, inactive: !answerIsOpen}"
        >
          <CreatorCard :imageResponse='imageResponse'></CreatorCard>
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
    answerIsOpen: Boolean
  },
  data(){
    return {
    }
  },
  components: {
    CreatorCard
  },
}
</script>

<style scoped>
.v-expansion-panels{
    max-width: 79%
}
.active{
  display: block
}
.inactive{
  display: none
}
</style>