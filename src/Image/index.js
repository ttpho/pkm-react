import React, { useState } from 'react';
import { StyledImage } from './style';

function Image(props) {
  const [isFailed, setFailed] = useState(false)
  const fallback = () => {
    if (props.fallBackSrc) {
      setFailed(true)
    }
  };

  return (
    isFailed
      ? <StyledImage src={props.fallBackSrc} />
      : <StyledImage src={props.src} onError={fallback} />
  )
}

export default Image;