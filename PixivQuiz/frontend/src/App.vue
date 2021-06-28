<template>
  <div id="app">
    <h1>これはほーむがめんです</h1>
    {{ info }}
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'App',

  data () {
    return {
      info: null
    }
  },
  mounted () {
    axios
      .get('/images')
      .then(response => (this.info = response.data))
  }
}
</script>