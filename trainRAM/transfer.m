vgg16net = dagnn.DagNN.loadobj(load('trained.mat'));
net = [];
net.layers = [];
net.meta.normalization.imageSize = [125,125,3];
net.meta.normalization.averageImage = reshape(single([123,117,104]),[1,1,3]);


try
net.layers{end+1} = struct(...
    'name', 'conv1_1', ...
    'type', 'conv', ...
    'weights', {{vgg16net.params(1).value, vgg16net.params(2).value}}, ...
    'pad', 1, ...
    'stride', 1) ;
net.layers{end+1} = struct(...
    'name', 'relu1_1', ...
    'type', 'relu') ;
end

try
net.layers{end+1} = struct(...
    'name', 'conv1_2', ...
    'type', 'conv', ...
    'weights', {{vgg16net.params(3).value, vgg16net.params(4).value}}, ...
    'pad', 1, ...
    'stride', 1) ;
end

try
    net.layers{end+1} = struct(...
    'name', 'relu1_2', ...
    'type', 'relu') ;
net.layers{end+1} = struct(...
    'name', 'conv2_1', ...
    'type', 'conv', ...
    'weights', {{vgg16net.params(5).value, vgg16net.params(6).value}}, ...
    'pad', 1, ...
    'stride', 1) ;
net.layers{end+1} = struct(...
    'name', 'relu2_1', ...
    'type', 'relu') ;
end

try
net.layers{end+1} = struct(...
    'name', 'conv2_2', ...
    'type', 'conv', ...
    'weights', {{vgg16net.params(7).value, vgg16net.params(8).value}}, ...
    'pad', 1, ...
    'stride', 1) ;

end

try
    net.layers{end+1} = struct(...
    'name', 'relu2_2', ...
    'type', 'relu') ;
net.layers{end+1} = struct(...
    'name', 'conv3_1', ...
    'type', 'conv', ...
    'weights', {{vgg16net.params(9).value, vgg16net.params(10).value}}, ...
    'pad', 1, ...
    'stride', 1) ;
net.layers{end+1} = struct(...
    'name', 'relu3_1', ...
    'type', 'relu') ;
end

try
net.layers{end+1} = struct(...
    'name', 'conv3_2', ...
    'type', 'conv', ...
    'weights', {{vgg16net.params(11).value, vgg16net.params(12).value}}, ...
    'pad', 1, ...
    'stride', 1) ;
net.layers{end+1} = struct(...
    'name', 'relu3_2', ...
    'type', 'relu') ;
end

try
net.layers{end+1} = struct(...
    'name', 'conv3_3', ...
    'type', 'conv', ...
    'weights', {{vgg16net.params(13).value, vgg16net.params(14).value}}, ...
    'pad', 1, ...
    'stride', 1) ;
end

% net.layers{end+1} = struct(...
%     'name', 'norm', ...
%     'type', 'spnorm',...
%     'param',[125 125 1/(125*125) 2]) ;
net.layers{end+1} = struct(...
    'name', 'norm', ...
    'type', 'lrn',...
    'param',[5 1 0.0001/5 0.75]) ;

save('../track4vot/simplenn_vgg_deepdcfnet.mat','net');
net = load('../track4vot/simplenn_vgg_deepdcfnet.mat');
net = vl_simplenn_tidy(net.net) ;
res = vl_simplenn(net, rand(125,125,3,'single')) ;




