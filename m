Return-Path: <SRS0=Ca3j=E3=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB06EC388F9
	for <intel-gfx@archiver.kernel.org>; Sat, 21 Nov 2020 10:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0633622240
	for <intel-gfx@archiver.kernel.org>; Sat, 21 Nov 2020 10:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0633622240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glidos.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EE66E992;
	Sat, 21 Nov 2020 10:52:06 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209D36E970
 for <intel-gfx@lists.freedesktop.org>; Sat, 21 Nov 2020 10:52:05 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id s8so13453961wrw.10
 for <intel-gfx@lists.freedesktop.org>; Sat, 21 Nov 2020 02:52:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KPYr7oL7KZ/w04kHqGsL1/eAbprbswck129ExtTnOdg=;
 b=ZqAAdbCy8r3OyY2DnfGnJuzAKLwcaRb8jGne7rV2XvVEklEPgvpUlwUHh7AfWnH1BD
 J5grzQ2GxUhvZgHc0tzd8idyVBaxi9yWdObdnqoXGIPFIWB3QuGMEtK8QUePsPhqT+zK
 ozCXG9um1IRTr0PWPNM1rIIpAvhacer6bq/7zMYCBadExpVGwJqUCmaPhu4dRYByc8D/
 OiqMlw8m3iOtC86BXw+YDkin2uY7IF2cPddbOq+RZQql1VQcbMlOsaKKNyGJOMmuJX+s
 rFWdKRuvPmv21a/6ow4gNe/ZqwaRpS/BcNy1cUrb0wUwph8lrBnb5cMXpckw+o7qCCP0
 fkbQ==
X-Gm-Message-State: AOAM5336n8dn6IfmBMJbUZevp4PYt0Y3Lx58qTJRTSXFDWXvwimlHXLk
 rdjLZrqq9CVAZjNtVZtwUYmH6fwb9r4=
X-Google-Smtp-Source: ABdhPJxbmfszSaJP59CLNQ/CH2NhECbXFrTCuEUmsdpbS9+laSUFvhSD2WieLkmhELbHW+Z6ga3Y5A==
X-Received: by 2002:adf:f808:: with SMTP id s8mr21117440wrp.257.1605955923410; 
 Sat, 21 Nov 2020 02:52:03 -0800 (PST)
Received: from [10.0.0.21] (smtp.glidos.net. [82.69.85.168])
 by smtp.gmail.com with ESMTPSA id w21sm6935926wmi.29.2020.11.21.02.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 02:52:02 -0800 (PST)
To: Jani Nikula <jani.nikula@linux.intel.com>, intel-gfx@lists.freedesktop.org
References: <ac472118-be43-dc8d-87a3-c4d17c9d9f26@glidos.net>
 <87sg98ox2i.fsf@intel.com>
From: Paul Gardiner <lists@glidos.net>
Message-ID: <d89b2287-51dc-87a5-4e38-022b0b8da648@glidos.net>
Date: Sat, 21 Nov 2020 10:52:02 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <87sg98ox2i.fsf@intel.com>
Content-Language: en-GB
Subject: Re: [Intel-gfx] Does the intel driver support faking a connected
 monitor?
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On 17/11/2020 14:52, Jani Nikula wrote:
> On Thu, 29 Oct 2020, Paul Gardiner <lists@glidos.net> wrote:
>> I use an open source DVR called MythTV. I've just swapped from using
>> nvidia graphics to intel graphics. Generally it's working great, but
>> I've run into one thing I used to do with the old system that I cannot
>> find out how to achieve with the new.
>>
>> MythTV doesn't currently entirely handle starting without a TV
>> connected. With nvidia graphics I could specify, within the X config,
>> the "ConnectMonitor" and "CustomEDID" options to fool MythTV into
>> thinking there was a TV. With intel graphics I can load EDID, but so far
>> I haven't discovered an equivalent of the "ConnectedMonitor" option.
> 
> Sorry for the delay, I seem to have missed this.
> 
> Please try a kernel command-line parameter to force enable the
> connector.
> 
> video=TV-1:e
> 
> Assuming the connector name is "TV-1"; replace with whatever you have.


Thanks for the reply. I gave that a try, in my case "video=HDMI1:e", but 
saw no difference. That's KMS, right? Is there anything I might have 
failed to install or enable that KMS relies on? Are there any logs I 
should monitor?
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
