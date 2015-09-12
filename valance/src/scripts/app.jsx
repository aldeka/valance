'use strict';

var React = require('react'),
    remote = window.require('remote');

var Toolbar = React.createClass({
    render: function () {
        return (
            <div className="valance-toolbar-container">
                <div className="valance-toolbar">
                    <div className="toolbar-window-controls">
                        <button className="close" onClick={ this.closeWindow } />
                        <button className="minimize" onClick={ this.minimizeWindow } />
                        <button className="maximize" onClick={ this.maximizeWindow } />
                    </div>
                    <div className="title">
                        hello world
                    </div>
                </div>
            </div>
        );
    },
    closeWindow: function(){
        remote.getCurrentWindow().close();
    },
    minimizeWindow: function(){
        remote.getCurrentWindow().minimize();
    },
    maximizeWindow: function(){
        remote.getCurrentWindow().maximize();
    }
});

React.render(
  <Toolbar />,
  document.getElementById('toolbar')
);

console.log('whee');
