<template>
  <div class="container">
    <h2 class="subtitle">Cadastro</h2>
      <form @submit="formSubmit">
        <p v-if="errors.length">
          <b>Por favor, corrija o(s) seguinte(s) erro(s):</b>
          <ul>
              <li>{{ errors }}</li>
          </ul>
        </p>
        <label>Palavra 1:</label>
        <input type="text" v-model="word1" />
        <label>Palavra 2:</label>
        <input type="text" v-model="word2" />
        <button class="button is-success is-small">Salvar</button>
      </form>
      <table class="align table">
        <thead>
          <tr>
            <th colspan="1"></th>
            <th>Anagrama 1</th>
            <th>Anagrama 2</th>
            <th>É anagrama?</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><strong>Anagrama Salvo:</strong></td>
            <td>{{saved.word1}}</td>
            <td>{{saved.word2}}</td>
            <td>{{saved.result}}</td>
          </tr>
        </tbody>
      </table>
    <router-link to="/"><button type="button" class="button is-light">Voltar</button></router-link>
  </div>
</template>

<script>
export default {
  mounted () {
    console.log('Component mounted.')
  },
  data () {
    return {
      errors: [],
      word1: '',
      word2: '',
      saved: ''
    }
  },
  methods: {
    formSubmit (e) {
      this.errors = []
      if (!this.word1) {
        this.errors.push('A palavra 1 é obrigatória.')
      }
      if (!this.word2) {
        this.errors.push('A palavra 2 é obrigatória.')
      }
      e.preventDefault()
      let currentObj = this
      this.axios
        .post('http://localhost:5000/anagrams', {
          word1: this.word1,
          word2: this.word2
        })
        .then(function (response) {
          currentObj.saved = response.data
        })
        .catch(function (error) {
          currentObj.saved = error
        })
    },
    getAnagrams: function () {
      this.axios.get('http://localhost:5000/anagrams')
        .then(function (response) {
          console.log(response)
          console.log(response.data.results)
          this.anagrams = response.data.results
        })
        .catch(function (error) {
          console.log(error)
        })
    }
  }
}
</script>

<style scoped>
.align{
    margin-left: 30%;
}
</style>
