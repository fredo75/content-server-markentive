import "bootstrap";

import{algolia} from '../components/algolia.js.erb';
 if (document.getElementById('my-widget')){
  algolia();
 }
import{style_widget} from '../components/style_widget.js';
 if (document.getElementById('my-widget')){
  style_widget();
 }
