Return-Path: <SRS0=Mptj=H7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6EBC433DB
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Mar 2021 09:09:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4653864E01
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Mar 2021 09:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4653864E01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF746E526;
	Mon,  1 Mar 2021 09:09:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804876E526
 for <intel-gfx@lists.freedesktop.org>; Mon,  1 Mar 2021 09:09:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE98A64E04;
 Mon,  1 Mar 2021 09:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614589753;
 bh=cWxdKqt2+NPSLGbZEsoYm3/hKAY685hWO1NrXZ6nOCM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kq7hGS6FMBkfy7E1SCifio5KpC9f2zbD1fcAcKiXWZaQ/aROAlBr2GIbZp1yWVpkD
 jbaoL2jLpVlU+tL7+U0+mOJ1F6w2cmfuZIPMOkjbDGYF1oqPssNX/26SxIsRFw4mHE
 oNXiNuXydQDHW/6ykYQlbwaDcz3PgvElJi/p4J5c=
Date: Mon, 1 Mar 2021 10:09:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Diego Calleja <diegocg@gmail.com>
Message-ID: <YDyvNoiRAQwT4boR@kroah.com>
References: <3423617.kz1aARBMGD@archlinux> <YDuzbvIjMO5mFcYm@kroah.com>
 <1911334.sV3ZJath2r@archlinux>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1911334.sV3ZJath2r@archlinux>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

On Sun, Feb 28, 2021 at 09:05:45PM +0100, Diego Calleja wrote:
> El domingo, 28 de febrero de 2021 16:14:54 (CET) Greg KH escribi=F3:
> > Is this the same issue reported here:
> > 	https://lore.kernel.org/r/f1070486-891a-8ec0-0390-b9aeb03178ce@redhat.=
com
> > ?
> =

> I just tested current mainline (which already contains the three commits =
mentioned in the bugzilla),
> and the problems have disappeared.

I do not see all 3 commits in Linus's tree already, am I missing
something?

What are the git ids that you are looking at?

thanks,

greg k-h
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
