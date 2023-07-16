// add class style
import Quill from 'quill/quill';
let Inline = Quill.import('blots/inline');

class Customclass extends Inline{    
    static create(value){
        let node = super.create();
        node.setAttribute('class','class_name');
        return node;    
    } 
}

Customclass.blotName = 'customClass';
Customclass.tagName = 'div';
Quill.register(Customclass);