Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AB8CCD19A
	for <intel-gfx@archiver.kernel.org>; Tue, 18 Nov 2025 07:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1DA10E0FD;
	Tue, 18 Nov 2025 07:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="24QE6ZMl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HemVkTlf";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC6B10E0FD
 for <intel-gfx@lists.freedesktop.org>; Tue, 18 Nov 2025 07:24:53 +0000 (UTC)
Date: Tue, 18 Nov 2025 08:24:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1763450691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I9vA6V+bN9GTdLdJJnTr5BmlcMkR802o3dcmS/oJ4PA=;
 b=24QE6ZMlr+aPw0mCJ5+WZU96Ur1bJED22ECyuR3qc6mknaLzxVccN1eBwGOEHnhDPXViIi
 vYgzPxjYImC932JHg5SRA4a/U7iRiyXlufjgEKN4WCeGZs0vyBoTiY57FYZhIlaLZIjOYL
 +alp7QvobezEF44LShBi4xm5QwByUm+lr5oir3v42WJgDcsNA1jjMRsN3D7i9qQlM6SH/w
 Q7jKWbml/XlgMaWqRO6CbEuEcKtaMflllcFEPJbOfhRueQ9ruRBPn/TM+ku3PXkSxlYXiS
 tZlF7YYrv2qXgzM7t0CdOvC+IbV/y+85xI811fdS8iBRo5Im02eMP11MJthBmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1763450691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I9vA6V+bN9GTdLdJJnTr5BmlcMkR802o3dcmS/oJ4PA=;
 b=HemVkTlfIKjmIexQaIi7tETka6Ixoo5dyRx/jz0Qu6Db6AH88jYgFE/IZlIzrJ2xfOoL2m
 0DLyByvQHHJXBSDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: pengdonglin <dolinux.peng@gmail.com>
Cc: tj@kernel.org, tony.luck@intel.com, jani.nikula@linux.intel.com,
 ap420073@gmail.com, jv@jvosburgh.net, freude@linux.ibm.com,
 bcrl@kvack.org, trondmy@kernel.org, longman@redhat.com,
 kees@kernel.org, hdanton@sina.com, paulmck@kernel.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 linux-nfs@vger.kernel.org, linux-aio@kvack.org,
 linux-fsdevel@vger.kernel.org,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-s390@vger.kernel.org,
 cgroups@vger.kernel.org
Subject: Re: [PATCH v3 00/14] Remove redundant rcu_read_lock/unlock() in
 spin_lock
Message-ID: <20251118072449.PFe_yjOF@linutronix.de>
References: <20250916044735.2316171-1-dolinux.peng@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250916044735.2316171-1-dolinux.peng@gmail.com>
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

On 2025-09-16 12:47:21 [+0800], pengdonglin wrote:
Hi,

> There is no need no explicitly start a RCU read section if one has already
> been started implicitly by spin_lock().
> 
> Simplify the code and remove the inner rcu_read_lock() invocation.

I'm not going argue if this is a good or not but: If you intend to get
this merged I suggest you rebase your series (or what is left since I
think a few patches got merged) on top of current tree and resend them
individually targeting the relevant tree/ list. Otherwise everyone might
think someone else is in charge of this big series.

Sebastian
