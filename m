Return-Path: <SRS0=yQCO=KD=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A12C433B4
	for <intel-gfx@archiver.kernel.org>; Sat,  8 May 2021 18:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 747FC601FD
	for <intel-gfx@archiver.kernel.org>; Sat,  8 May 2021 18:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 747FC601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=earthlink.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D081589F89;
	Sat,  8 May 2021 18:21:53 +0000 (UTC)
X-Greylist: delayed 3833 seconds by postgrey-1.36 at gabe;
 Sat, 08 May 2021 18:21:52 UTC
Received: from elasmtp-masked.atl.sa.earthlink.net
 (elasmtp-masked.atl.sa.earthlink.net [209.86.89.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D23B89F89
 for <intel-gfx@lists.freedesktop.org>; Sat,  8 May 2021 18:21:52 +0000 (UTC)
Received: from [24.50.25.154] (helo=[192.168.0.11])
 by elasmtp-masked.atl.sa.earthlink.net with esmtpa (Exim 4)
 (envelope-from <mrmazda@earthlink.net>) id 1lfQaO-0008fF-AP
 for intel-gfx@lists.freedesktop.org; Sat, 08 May 2021 13:17:52 -0400
To: intel-gfx@lists.freedesktop.org
From: Felix Miata <mrmazda@earthlink.net>
Organization: less than infinite
Message-ID: <e037c0b7-9500-9989-fa5d-b4c9927b4ce5@earthlink.net>
Date: Sat, 8 May 2021 13:17:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 SeaMonkey/2.49.5
MIME-Version: 1.0
X-ELNK-Trace: 7235c9a3853724b974bf435c0eb9d4788364a697d25371dfe6edd46125b9b58c589d78ac86bca543350badd9bab72f9c350badd9bab72f9c350badd9bab72f9c
X-Originating-IP: 24.50.25.154
Subject: [Intel-gfx] i810e & i815 no /dev/dri/card0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

https://manpages.debian.org/testing/xserver-xorg-video-intel/intel.4.en.html
says these IGPs are supported. Is this true? I'm trying to get them to work in
Debian Stretch and Buster, but having no luck finding /dev/dri/card0. What doc
explains how to acquire it? VESA is producing only 640x480. :~(

I see in http://bugzilla.opensuse.org/show_bug.cgi?id=1185174 it requires heroics
as of kernel 5.12. :( But, Stretch is on 4.9 and Buster is on 4.19, so should
still work, right?
-- 
Evolution as taught in public schools is, like religion,
	based on faith, not based on science.

 Team OS/2 ** Reg. Linux User #211409 ** a11y rocks!

Felix Miata  ***  http://fm.no-ip.com/
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
