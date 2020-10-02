import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

// PHASE 3 - using redux' built-in applyMiddleware
function addLoggingToDispatch(store) {
  return (next) => (action) => {
    console.log("old state", store.getState()); // old state
    console.log("action", action);
    next(action);
    console.log("dispatch in addLoggingToDispatch", next);
    console.log("new state", store.getState()); // new state
  }
}

// BONUS - add logging for next
function addLoggingForNextDispatch(store) {
  return (next) => (action) => {
    console.log("current dispatch", next);
    next(action);
    console.log("next dispatch", next);
  }
}

const configureStore = (preloadedState = {}) => {
  // Phase 3 - pass in enhancer // Bonus - add new middleware
  const store = createStore(rootReducer, preloadedState, applyMiddleware(addLoggingToDispatch, addLoggingForNextDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

export default configureStore;
