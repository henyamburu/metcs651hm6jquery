using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace Web
{
    [ServiceContract(Namespace = "")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class Service
    {
        // To use HTTP GET, add [WebGet] attribute. (Default ResponseFormat is WebMessageFormat.Json)
        // To create an operation that returns XML,
        //     add [WebGet(ResponseFormat=WebMessageFormat.Xml)],
        //     and include the following line in the operation body:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
        [OperationContract, WebGet(ResponseFormat = WebMessageFormat.Json)]
        public string GetSortedWordsCount(string words)
        {
            string previewWords = string.Empty;
            words = HttpUtility.UrlDecode(words);
            if (!string.IsNullOrWhiteSpace(words))
            {               
                Hashtable hashTable = new Hashtable();
                foreach (string word in words.Split(new string[] { " " }, StringSplitOptions.RemoveEmptyEntries))
                {
                    var wordParsed = Regex.Replace(word, @"^\W*(\w+)\W*", "$1");
                    if (!string.IsNullOrWhiteSpace(wordParsed) && hashTable[wordParsed] == null)
                        hashTable.Add(wordParsed, 1);
                    else if (!string.IsNullOrWhiteSpace(wordParsed))
                        hashTable[wordParsed] = (int)hashTable[wordParsed] + 1;
                }

                if (hashTable.Count == 0)
                    previewWords = "No words found!!";

                int totalWords = 0;
                foreach (string key in hashTable.Keys.Cast<string>().OrderBy(k => k))
                {
                    var wordsCounted = int.Parse(hashTable[key].ToString());
                    totalWords += wordsCounted;
                    if (wordsCounted > 1)
                        previewWords = string.Format("{0} {1} {2} <br/>", previewWords, key, wordsCounted);
                    else
                        previewWords = string.Format("{0} {1} <br/>", previewWords, key);
                }

                previewWords = string.Format("{0}<br/><b>{1}</b>", previewWords, totalWords);
            }
            else
                previewWords= "No line/s of text entered!!";

            return previewWords;
        }

        // Add more operations here and mark them with [OperationContract]
    }
}
