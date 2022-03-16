//
//  imageManager.swift
//  ImageViewer
//
//  Created by Parth Antala on 2022-03-15.
//

import Foundation
class imageManager
{
    private var imageList = [image]()

    func addNewImage(i:image)
    {
        imageList.append(i)
    }

    func getImageList()->[image]{
        return imageList
    }
}
