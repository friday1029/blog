import { DirectUpload } from "@rails/activestorage"
import ImageResize from "@taoqf/quill-image-resize-module/image-resize.min";
// import Quill from 'quill/quill';
import Quill from 'quill/dist/quill.js';
export default Quill;

import htmlEditButton from "quill-html-edit-button";
import 'quill/dist/quill.snow.css'

// embed video with ratio
import './embed-video.js'
//import './custom-css.js'

Quill.register({
    "modules/imageResize": ImageResize,
    "modules/htmlEditButton": htmlEditButton
});

document.addEventListener("DOMContentLoaded", function (event) {
    var toolbarOptions = [
        //[{ 'font': [] }],
        [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
        [{ 'header': [4, 5, 6, false] }],
        
        [{ 'color': [] }, { 'background': [] }], 
        [{ 'align': [] }],
        ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
        ['link', 'image', 'video'],
        
        ['blockquote'],
        ['code-block'],
      
        [{ 'list': 'ordered'}, { 'list': 'bullet' }],
        //[{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
        [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
        [{ 'direction': 'rtl' }],                         // text direction
        
        //['figure'],
        //['customClass'],
        ['clean']                                         // remove formatting button
    ];

    // add font list
    // var Font = Quill.import('formats/font');
    // Font.whitelist = ['verdana', 'helvetica', 'Roboto'];
    // Quill.register(Font, true);

    var options = {
        modules: {
            toolbar: {
                container: toolbarOptions,  // Selector for toolbar container
                handlers: {
                    'figure': function(){
                        const range = this.quill.getSelection(true);
                        this.quill.insertEmbed(range.index,'figure',figcaptionHTML);
                    },
                  'image': function(){
                    const input = document.createElement('input');
                    input.setAttribute('type', 'file');
                    input.setAttribute('accept', 'image/*');
                    input.click();
                    input.onchange = async function() {
                        const item = this;
                        const file = input.files[0];
                        // Save current cursor state
                        const range = item.quill.getSelection(true);

                        var reader = new FileReader();
                        reader.onload = (function(theFile) {
                            return function(e) {
                                var img = e.target.result;
                                //console.log(e.target.result);       
                                
                                $.ajax({
                                    url: '/api/v1/upload_image',
                                    type: 'POST',
                                    data: { image: img }
                                }).done(function(result) {
                                    item.quill.insertEmbed(range.index, 'image', result.image_url); 
                                });;
                            };
                        })(file);
                        reader.readAsDataURL(file);
                    }.bind(this); // react thing
                  }
                }
            },
            htmlEditButton: {
            },
            imageResize: {
                displaySize: true,
                displayStyles: {
                  backgroundColor: 'black',
                  border: 'none',
                  color: 'white'
                },
                modules: [ 'Resize', 'DisplaySize', 'Toolbar' ]
            }
        },
        placeholder: '...',
        theme: 'snow'
    };

    var simple_option = {
        modules: {
            toolbar: {
                container: [
                    [{ 'header': [4, false] }],
                    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                    ['clean']                                         // remove formatting button
                ]
            },
            htmlEditButton: {
            }
        },
        placeholder: '...',
        theme: 'snow'
    };
    
    var editor = new Array;

    if($(".content-editor").length > 0){
        $(".content-editor").each(function(editorID){
            $(this).attr("id","contentID" + editorID);
            // var editor = new Quill('.content-editor', options);
            if($(this).hasClass("simple")){
                editor[editorID] = new Quill("#contentID" + editorID, simple_option);
            }else{
                editor[editorID] = new Quill("#contentID" + editorID, options);
            }
        })
    }

    document.querySelector('form').onsubmit = function (e) {
        if($(".content-editor").length > 0){
            $(".content-editor").each(function(index){
                $(this).parents(".validation-input").find('textarea[class=article-content]').val(editor[index].root.innerHTML);
            })
            
            // e.preventDefault();
        }
    };
});
