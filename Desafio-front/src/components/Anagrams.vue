<template>
    <div>
      <h2 class="subtitle">Histórico:</h2>
      <table class="table-align table is-bordered is-striped is-narrow is-hoverable">
        <thead>
          <tr>
            <th>Palavra 1</th>
            <th>Palavra 2</th>
            <th>É anagrama?</th>
            <th colspan="1"></th>
          </tr>
        </thead>
        <tbody v-for="anagram in anagrams" :key="anagram.id">
          <tr>
            <td>{{ anagram.word1 }}</td>
            <td>{{ anagram.word1 }}</td>
            <td>{{ anagram.result }}</td>
            <td><button type="button" class="delete is-danger" v-on:click="removeAnagram(anagram)" >Remover</button></td>
          </tr>
        </tbody>
      </table>
      <router-link to="/new"><button type="button" class="button is-light">Cadastrar Anagrama</button></router-link>
    </div>
</template>

<script>

export default {
  data () {
    return {
      anagrams: []
    }
  },
  mounted: function () {
    this.axios.get('http://localhost:5000/anagrams')
      .then(response => {
        this.anagrams = response.data
      })
      .catch(function (error) {
        console.log(error)
      })
  },
  methods: {
    removeAnagram (anagram) {
      this.axios.delete(`http://localhost:5000/anagrams/${anagram.id}`)
        .then(response => {
          this.anagrams.splice(this.anagrams.indexOf(anagram), 1)
        })
        .catch(error => this.setError(error))
    }
  }

}
</script>

<style scoped>
.table-align{
    margin-left: 40%;
}
</style>
