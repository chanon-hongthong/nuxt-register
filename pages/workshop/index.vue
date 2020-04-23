<template>
  <div>
    <v-app-bar color="primary" dense flat dark>
      <v-toolbar-title>WorkShop</v-toolbar-title>
    </v-app-bar>

    <v-container class="pt-0 pb-0">
      <v-row>
        <v-col cols="12" class="pt-0 pb-0">
          <div class="mt-3 text-primary text-title text-center">
            20 April 2020
          </div>
        </v-col>
      </v-row>

      <v-row>
        <v-col cols="12">
            <Card :active="selectedWorkshop==1" v-on:moreDetail="moreDetail" v-on:chooseWorkshop="chooseWorkshop(1)" />
            <Card :active="selectedWorkshop==2" v-on:moreDetail="moreDetail" v-on:chooseWorkshop="chooseWorkshop(2)" />
        </v-col>

        <v-col cols="12">
          <v-btn rounded color="primary" dark class="w-100 my-btn" @click="next"     
            >Next</v-btn
          >
        </v-col>
      </v-row>

      <v-dialog v-model="dialog" max-width="290">
        <v-card>
          <v-img
            class="white--text align-end"
            height="200px"
            src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
          >
          </v-img>

          <v-card-title class="headline"
            >Use Google's location service?</v-card-title
          >

          <v-card-text>
            Let Google help apps determine location. This means sending
            anonymous location data to Google, even when no apps are running.
          </v-card-text>

          <v-card-actions>
            <v-spacer></v-spacer>

            <v-btn color="green darken-1" text @click="dialog = false">
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
      dialog: false,
      selectedWorkshop: 0
    };
  },
  methods: {
    next() {
      this.$router.push("/workshop/more");
    },
    moreDetail() {
      this.dialog = true;
    },
    chooseWorkshop(id){
        this.selectedWorkshop = id
    }
  }
};
</script>
