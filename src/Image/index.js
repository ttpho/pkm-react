import React from 'react';
import {StyledImage} from './style';

class Image extends React.Component {
    constructor(props) {
      super(props);
      this.state = { failed: false };
  
      this.fallback = () => {
        if (this.props.fallBackSrc) {
          this.setState({ failed: true });
        }
      };
    }
  
    render() {
      if (this.state.failed) {
        return <StyledImage src={this.props.fallBackSrc} />;
      } else {
        return <StyledImage src={this.props.src} onError={this.fallback} />;
      }
    }
  }
  export default Image;