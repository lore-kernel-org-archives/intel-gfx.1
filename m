Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63A9106F2FE
	for <intel-gfx@archiver.kernel.org>; Thu, 26 Mar 2026 08:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6417B10EA0E;
	Thu, 26 Mar 2026 08:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ibcv62xT";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E369510EA0E
 for <intel-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 08:46:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 197F840C26;
 Thu, 26 Mar 2026 08:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA30C116C6;
 Thu, 26 Mar 2026 08:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1774514776;
 bh=jRpEdutX9ti8N1xwFcSl90MFJfF5ESk51VrhbGqUPg4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ibcv62xTT/CeNZXsGR/PzlWHPoPaUGi/bq9RjZou40N8+vGLA5Ux7pXNRrNiVmSMy
 Ui3oUn/h81d4MNDXqzbbTGl682mHpSAEEW73MjVMhL1duNCBr1O/dIxxK87BUa3JsS
 otrQmqsslIf5ElTcpQUKutCG4efni7XLxAfXYw/k=
Date: Thu, 26 Mar 2026 09:45:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Yassine Mounir <sosohero200@gmail.com>,
 intel-gfx@lists.freedesktop.org, security@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: AI slop security report against i915 (Was: Re: [PATCH v2]
 drm/i915/gem: Fix UAF race in eb_relocate_vma)
Message-ID: <2026032643-disband-reorder-c0fd@gregkh>
References: <20260324151741.29338-1-sosohero200@gmail.com>
 <177442567303.11552.5320450093167124387@jlahtine-mobl>
 <CANq=4mAEmEQWTUBpDJAgaiw930NUzL6-7EV-Y2WqLGst2YWLiw@mail.gmail.com>
 <177444763778.66558.14341959485998155867@jlahtine-mobl>
 <acQDZJFtsEtm183A@intel.com>
 <CANq=4mDtmtz5ZFjCCoeAXEWN82J9m8+DLochsNc6BzfwJ6Pdpg@mail.gmail.com>
 <CANq=4mC3+B4akvpp=nr_w1bbnhDwUXx=EzyQtHQpR9DN=ewCMA@mail.gmail.com>
 <acReP5LYxOKCG80B@intel.com>
 <CANq=4mCzoOGCAGZK6KAnCK4iaH+Woy49L=6Y5rCpuNmg_vEneQ@mail.gmail.com>
 <177450809396.10669.10897074578574249353@jlahtine-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177450809396.10669.10897074578574249353@jlahtine-mobl>
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

On Thu, Mar 26, 2026 at 08:54:53AM +0200, Joonas Lahtinen wrote:
> (+ Adding back security mailing list (where this started) and LKML for them
> to be aware of any further bogus security reports from the author)

Ugh, I was kind of thinking this might be the case based on the original
interactions here, but was willing to give the benifit of the doubt.

Time to go reset the "Days since we recieved AI slop reports" counter
back to 0...

thanks for following through on this.

greg k-h
