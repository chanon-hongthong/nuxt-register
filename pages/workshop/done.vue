<template>
     <div>
        <v-app-bar
        color="primary"
        dense
        flat
        dark
        >
        <v-toolbar-title>WorkShop Done</v-toolbar-title>
        </v-app-bar>

        <v-container class="pt-0 pb-0">
            <v-row>
                    <v-col cols="12">
                        <div class="set-padding">
                            <div class="text-center pt-0 pb-0">
                                <img src="~/assets/icon/profile.png" alt="" width="155">
                            </div>
                        <div class="w-100 text-center my-btn outlined text-primary" @click="back">Close</div>
                    </div>
                    </v-col>
            </v-row>
        </v-container>
    </div>

</template>

<script>
export default {
    data(){
        return {
            //name: this.$store.getters.getRegister.firstname
        }
    },
    methods:{
        workshop(){
            //this.$router.push('/workshop')
        },
        close(){

        }
    }
}
</script>