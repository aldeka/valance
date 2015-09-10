'use strict';

var React = require('react'),
    remote = window.require('remote');

var Toolbar = React.createClass({
    render: function () {
        return (
            <div className="toolbar">
                <div className="window-buttons">
                    <div className="button close" onClick={ this.closeWindow }>
                        <span>x</span>
                    </div>
                    <div className="button minimize" onClick={ this.minimizeWindow }>
                        <span>-</span>
                    </div>
                    <div className="button maximize" onClick={ this.maximizeWindow }>
                        <span>+</span>
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
