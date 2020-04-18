<template>
     <div>
        <v-app-bar
        color="primary"
        dense
        flat
        dark
        >
        <v-toolbar-title>Register</v-toolbar-title>
        </v-app-bar>

        <v-container class="pt-0 pb-0">
            <v-row>
                    <v-col cols="12">
                        <div class="set-padding">
                            <div class="text-center pt-0 pb-0">
                                <img src="~/assets/icon/profile.png" alt="" width="155">
                                <center>
                                    <h1 class="text-title">Welcome, {{ name }}</h1>
                                </center>
                            </div>
                        <v-btn rounded color="primary" dark class="w-100 mt-8 mb-2 my-btn" @click="workshop">Register Workshop</v-btn>
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
            name: this.$store.getters.getRegister.firstname
        }
    },
    methods:{
        workshop(){
            this.$router.push('/register/workshop')
        },
        close(){

        }
    }
}
</script>