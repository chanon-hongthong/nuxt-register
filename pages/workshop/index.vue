<template>
  <div>
    <v-app-bar color="primary" dense flat dark>
      <v-toolbar-title>WorkShop</v-toolbar-title>
    </v-app-bar>

    <v-container class="pt-0 pb-0">
      <v-row>
        <v-col cols="12" class="pt-0 pb-0">
          <div class="mt-3 text-primary text-title text-center">
            {{ list.date }}
          </div>
        </v-col>
      </v-row>

      <v-row>
        <v-col cols="12">
            <Card v-for="item in list.sessions"
              :sessions="item"
              :key="item.id"
              :active="selectedWorkshop.includes(item.id)" 
              v-on:moreDetail="moreDetail(item)"
              v-on:chooseWorkshop="chooseWorkshop(item)" />
        </v-col>

        <v-col cols="12">
          <v-btn v-if="index != workshops.length - 1" rounded color="primary" dark class="w-100 my-btn" @click="next"     
            >Next</v-btn>
          <div v-if="index > 0" class="w-100 text-center my-btn text-primary" @click="back">Back</div> 
        </v-col>

        <v-col cols="12">
          <v-btn v-if="selectedWorkshop.length != 0" rounded color="success" dark class="w-100 my-btn" @click="done"     
            >Done</v-btn>
        </v-col>
      </v-row>

      <v-dialog v-model="IsShowDialog" max-width="290">
        <v-card>
          <v-img
            class="white--text align-end"
            height="200px"
            :src="dialog.image"
          >
          </v-img>

          <v-card-title class="headline"
            >{{ dialog.title }}</v-card-title
          >

          <v-card-text>
            <p>{{ dialog.time }}</p>
            {{ dialog.detail }}
            <v-spacer></v-spacer>
            <p><span v-html="dialog.spakers"></span></p>
          </v-card-text>

          <v-card-actions>
            <v-spacer></v-spacer>

            <v-btn color="green darken-1" text @click="IsShowDialog = false">
              OK
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-container>
  </div>
</template>

<style lang="scss" scoped>
.v-dialog {
  .v-card {
    .v-image {
      opacity: 1;
      filter: alpha(opacity=100); /* For IE8 and earlier */
    }
  }
}
</style>

<script>
import Card from '~/components/Card'
export default {
  components:{
      Card
  },
  data() {
    return {
      IsShowDialog: false,
      index: 0,
      dialog:{
        title: '',
        image: '',
        detail: '',
        time: '',
        spakers: '',
        place: ''
      },
      selectedWorkshop: [],
      list: [],
      workshops: this.$store.getters.getWorkshop
    };
  },
  mounted(){
    this.list = this.workshops[this.index]
  },
  methods: {
    next() { 
      this.list = this.workshops[this.index += 1]
    },
    back(){
      this.list = this.workshops[this.index -= 1]
    },
    done(){
      this.$axios.patch(`https://mic-connect.firebaseio.com/workshop/line:0002.json`, { ...this.selectedWorkshop })
      .then((res) => {
        this.$router.push('/workshop/done')
      }).catch(e => console.log(e))
    },
    moreDetail(item) {
      this.IsShowDialog = true
      this.dialog = item
    },
    chooseWorkshop(item){
        const listId = this.list.sessions.map(session => session.id)
        if(this.selectedWorkshop.includes(item.id)){
          //item already in array do remove
          this.selectedWorkshop.splice(this.selectedWorkshop.indexOf(item.id), 1);
        }else{
          this.selectedWorkshop = this.selectedWorkshop.filter(session => !listId.includes(session))
          this.selectedWorkshop.push(item.id)
        }
    }
  }
};

</script>