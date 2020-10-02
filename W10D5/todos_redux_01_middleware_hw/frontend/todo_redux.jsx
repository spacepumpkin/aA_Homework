import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// PHASE 1 - create basic logger
// function addLoggingToDispatch(store) {
//   let newDispatch = store.dispatch;
//   return (action) => {
//     console.log("old state", store.getState()); // old state
//     console.log("action", action);
//     newDispatch(action);
//     console.log("new state", store.getState()); // new state
//   }
// }

// PHASE 2 - refactor into middleware
// function addLoggingToDispatch(store) {
//   return (next) => (action) => {
//     console.log("old state", store.getState()); // old state
//     console.log("action", action);
//     next(action);
//     console.log("new state", store.getState()); // new state
//   }
// }
// runs single or arr of middlewares
// function applyMiddlewares(store, ...middlewares) {
//   let dispatch = store.dispatch;
//   middlewares.forEach( (middleware) => {
//     dispatch = middleware(store)(dispatch);
//   })
//   return Object.assign({}, store, {dispatch});
// }

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState); // for Phase 2, need to use let

  // store.dispatch = addLoggingToDispatch(store); // Phase 1 - reassign dispatch (big NO)
  // store = applyMiddlewares(store, addLoggingToDispatch); // Phase 2 - apply middlewares then reassign store
  // Phase 3 - remove any modifications here; apply middleware in store.js
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
