// css use bootstrapt 5
//https://getbootstrap.com/docs/5.0/helpers/ratio/

//import Quill from 'quill/quill';
import Quill from 'quill/dist/quill.js';
var BlockEmbed = Quill.import('blots/block/embed');

class Video extends BlockEmbed {
    static create(value) {
      let node = super.create(value);
      node.classList.add("ratio-16x9");
      let iframe = document.createElement('iframe');
      iframe.setAttribute('frameborder', '0');
      iframe.setAttribute('allowfullscreen', true);
      iframe.setAttribute('src', value);
      node.appendChild(iframe);
      return node;
    }
  
    static value(domNode) {
      return domNode.querySelector("iframe").getAttribute('src');
    }
}

Video.blotName = 'video';
Video.className = 'ratio';
Video.tagName = 'div';


Quill.register({'formats/video': Video});