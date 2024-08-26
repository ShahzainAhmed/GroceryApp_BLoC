# Grocery App using BLoC
<p align="center" width="50%">
    <img width="25%" src="https://github.com/user-attachments/assets/7414caf3-24f7-4a31-beba-617cccb6060c">
</p>

## Why do we want to learn BLoC? What is the purpose of Statemanagement tool? Why want to learn it?
Most of the companies are using BLoC because it is easy to understand and it clearly seperates the UI from the business logic (between UI and network logic there is business logic which is going to make a connection between UI and network logic, so business layer that is BLoC it is going ot act as an layer so that u can keep it clean, that happens in clean architecutre, UI is not getting mixed with API calls) and network logic (API calls/ database connections). 

Every feature(screen) we have to make a seperate bloc logic, so add extension of bloc and then add it, and in that we going to write logic

Whenever we want to do anything on the UI we pass an event to the BLoC and bloc takes that event, do some logic, uses its brain and passes an state, and this state is going to update my userinterface (ui)

event -> block -> state

One state is going to be that is going to build my UI, whenever i am going inside my app, my ui should be build, this should be handled using home_state

Some are states that are actionable states, if I get those states in my UI, i want to take an action.

Some are build states some are actionable states.

Now decide whether this state is going to take an action, or it is going to build my UI

Now my UI should be listening to the states that my bloc is emitting, and it should accept the events that the Ui is passing

BlocConsumer: it is going to listen to the events also, it is also going to the states that are being emitted. 

****
1) BLoC
2) Provider
3) Riverpod
4) GetX
***
