Return-Path: <SRS0=KMKB=H6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4708C433E0
	for <intel-gfx@archiver.kernel.org>; Sun, 28 Feb 2021 15:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 868C664E85
	for <intel-gfx@archiver.kernel.org>; Sun, 28 Feb 2021 15:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 868C664E85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF74589E08;
	Sun, 28 Feb 2021 15:14:59 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6788089E08
 for <intel-gfx@lists.freedesktop.org>; Sun, 28 Feb 2021 15:14:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A78364D5D;
 Sun, 28 Feb 2021 15:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614525298;
 bh=0kulXnCuqpoPXjGDFeQl9JUjBoEgX7xs0FQJrTbfftk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s09CCmIcu3lwICBYaOp9HuCq+Ghwx2/jJ4pBpwcbYJzdNzECgSp3Qo8G0/6U4rCHC
 cjEHP6meZG8xStvlqoKgM/TIpS3O0DaSfAY2oH2SGcqnkyll0VrvwtTDrceENeQExx
 hEQUgWhF5gRrbcbINAS1ngHXxlaUmuDFPXrs9Qh0=
Date: Sun, 28 Feb 2021 16:14:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Diego Calleja <diegocg@gmail.com>
Message-ID: <YDuzbvIjMO5mFcYm@kroah.com>
References: <3423617.kz1aARBMGD@archlinux>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3423617.kz1aARBMGD@archlinux>
Subject: Re: [Intel-gfx] -stable regression in Intel graphics,
 introduced in Linux 5.10.9
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Sun, Feb 28, 2021 at 03:29:07PM +0100, Diego Calleja wrote:
> Hi,
> 
> There is a regression in Linux 5.10.9 that does not happen in 5.10.8. It is still there as
> of 5.11.1

Is this the same issue reported here:
	https://lore.kernel.org/r/f1070486-891a-8ec0-0390-b9aeb03178ce@redhat.com
?

If so, is this a problem in 5.11 as well?

thanks,

greg k-h
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
