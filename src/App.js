import './App.css';
import HomePage from "./components/HomePage";
import NewLand from "./components/NewLand";
import Auction from "./components/Auction";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

function App() {

  return (
    <div className="App">
      <Router>
        <Switch>
          <Route exact path="/">
            <HomePage />
          </Route>
          <Route path="/register">
            <NewLand />
          </Route>
          <Route path="/land/:landId">
            <Auction />
          </Route>
        </Switch>
      </Router>
    </div>
  );
}

export default App;
