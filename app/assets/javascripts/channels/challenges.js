/*
 *= require cable
 *= require_self
 *= require_tree .
 */

this.App = {};

App.cable = ActionCable.createConsumer();

App.messages = App.cable.subscriptions.create('ChallengesChannel', {
    received: function (response) {
        return console.log(response.data)
    }
});
