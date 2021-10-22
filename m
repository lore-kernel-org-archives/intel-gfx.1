Return-Path: <SRS0=Sdza=PK=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D5AC433EF
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 11:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B124610A1
	for <intel-gfx@archiver.kernel.org>; Fri, 22 Oct 2021 11:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B124610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862D36ED09;
	Fri, 22 Oct 2021 11:10:46 +0000 (UTC)
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C0E6ED09;
 Fri, 22 Oct 2021 11:10:45 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id 77so4225822qkh.6;
 Fri, 22 Oct 2021 04:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aiVwXv+tmTTQpkoNl9l5qG7n7E+c1M/GVJBi2XD6EdA=;
 b=DtXYnkFhkImQTXaaObvqj9DsmfRBI2I0pQ/P8QwJBKFffjlPzaWPnA0nyPTFj2g2JK
 UrurRHvOPzNU+Jd0C39o3CTq1cQr3JhnKfOMzRaqtRHcr2St4Rb4Y+n0Zcl/0ILrt9EQ
 Ht1uM1NlZ5epWYHxfPm+p8qIUzDYUSvr7WbioDnp7T6HP/N7LQ0oPZoVbmghT+exmr4q
 oDf7eWYIofl75eWk6x2oqqwT8YNk2rgsYYfv+LXiLb8LQZR7KzLNDlKkxlA7sE7Ilz41
 mCUkkB2O8xz2Glvfycg/NrSsJmktoPcIMppX/Cph3MoAtUYzfah7reJxyd4vIz/HA4MA
 aLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aiVwXv+tmTTQpkoNl9l5qG7n7E+c1M/GVJBi2XD6EdA=;
 b=jp3eVn7iDMO4aW/5mkWmU8DSJb6VT0pNvoDwUj1MZPD7Pb2AslamHQp09HJdrFOECg
 5qLGDu8zmrYDhQFXOa0Hb401dcvJwyLoSLOEUUIQJe8dyFG7imwdlPnQafKz9S+kIV3G
 2+YplDNALSrtGvzwwwAqcKN42TaDFsw2lVstoQHtik6IeWgaVis8vybUz3oRL3Mfwg+/
 dJPWL7r2NdhQPV5bfCNk3VV3/SCNaNxxFjfdRnDJeRSUMMSlnBpKxeIGnAHorX3MyeCL
 vQ7RMb/BnVBKA+8m6/796IwFw9i4/eE5Ntk8wjQJ5I8bZrlrHS0DXyB4VeAT8b6OiVpk
 IWTg==
X-Gm-Message-State: AOAM531iZllzi1TVY0rgHriiA4bWeu4Pu6sd5VijrCmpY1nSrQ5QmFMg
 zXVNmJdworuVJt9fbedvxGxMhpbNqZjp1vq0IcuLcsbXRoA=
X-Google-Smtp-Source: ABdhPJz96wspPMBUFWrai6yTSDuTrgUbrZlpHnmUbp8ZnqSqcUZCpEluQl4gXmvpHYBb/o3zVNVsPRFLBuziH/Br3Bk=
X-Received: by 2002:a37:bb85:: with SMTP id l127mr9481371qkf.223.1634901043676; 
 Fri, 22 Oct 2021 04:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-25-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211021103605.735002-25-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 22 Oct 2021 12:10:16 +0100
Message-ID: <CAM0jSHOoqOHEsE4SWr0QJ_CXWGCaQGBjksWB7Ky8hfW2UC+c+A@mail.gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-gfx] [PATCH 25/28] drm/i915: Require object lock when
 freeing pages during destruction
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
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Thu, 21 Oct 2021 at 11:37, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> TTM already requires this, and we require it for delayed destroy.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
